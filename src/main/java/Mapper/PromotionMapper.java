package Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import Model.PromotionModel;

public class PromotionMapper implements IRowMapper<PromotionModel> {

	@Override
	public PromotionModel mapRow(ResultSet resultSet) {
		try {	
			PromotionModel promotion = new PromotionModel();
			promotion.setId(resultSet.getInt("id"));
			promotion.setCode(resultSet.getString("code"));
			promotion.setName(resultSet.getString("name"));
			promotion.setPercent(resultSet.getString("percent"));
			promotion.setImg(resultSet.getString("img"));
			promotion.setAlt_img(resultSet.getString("alt_img"));
			return promotion;
		}catch(SQLException e) {
			return null;
		}
	}

}
