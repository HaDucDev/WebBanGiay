<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ attribute name="thumbnail" required="false" type="java.lang.String" %>
<%@ attribute name="alt" required="false" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${fn:trim(thumbnail)}" />
<c:choose>
    <c:when test="${empty path}">
        <c:set var="path" value="/images/reference/userTu/images/giaythethaonam.jpg" />
    </c:when>
    <c:when test="${fn:startsWith(path, 'https://') or fn:startsWith(path, 'http://') or fn:startsWith(path, '/')}">
        <%-- Absolute URLs and paths already have a root. --%>
    </c:when>
    <c:when test="${fn:startsWith(path, 'assets/') or fn:startsWith(path, 'images/')}">
        <c:set var="path" value="/${path}" />
    </c:when>
    <c:otherwise>
        <%-- Older records store only a filename in the images directory. --%>
        <c:set var="path" value="/images/${path}" />
    </c:otherwise>
</c:choose>
<c:url var="imageUrl" value="${path}" />
<img src="<c:out value='${imageUrl}' />" alt="<c:out value='${alt}' />" />
