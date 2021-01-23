package Mapper;

import java.sql.ResultSet;

public interface IRowMapper<T> {
	T mapRow(ResultSet resultSet);
}
