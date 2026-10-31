package DAO;

import java.util.List;

import Mapper.IRowMapper;


public interface GenericDAO<T> {
	<T>List<T>query(String sql, IRowMapper<T>  rowMapper, Object... parameters);
	void update (String sql, Object... parameters);
	Long insert (String sql, Object... parameters);
	int count(String sq, Object... parameters);

}
