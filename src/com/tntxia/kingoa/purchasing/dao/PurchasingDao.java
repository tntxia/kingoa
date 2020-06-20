package com.tntxia.kingoa.purchasing.dao;

import com.tntxia.db.DBConnection;
import com.tntxia.oa.purchasing.entity.Purchasing;
import com.tntxia.oa.purchasing.entity.PurchasingProduct;
import com.tntxia.oa.purchasing.entity.PurchasingRefundProduct;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.jdbc.core.JdbcTemplate;

public class PurchasingDao {
	
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public Purchasing getPurchasingById(String id) throws SQLException {
		DBConnection db = new DBConnection();

		String sql = "select * from procure where id='" + id + "'";
		ResultSet rs = db.executeQuery(sql);
		Purchasing res = new Purchasing();
		if (rs.next()) {

			res.setId(rs.getInt("id"));
			res.setNumber(rs.getString("number"));
			res.setMan(rs.getString(3));
			res.setSaleNumber(rs.getString("sub").trim());
			res.setWarehouse(rs.getString(5));
			res.setSupplierNumber(rs.getString("co_number"));
			res.setSupplier(rs.getString(7));
			res.setPurchasePlace(rs.getString(8));
			res.setDeliverDate(rs.getString(9));
			res.setTransportationExpense(rs.getString(10));
			res.setPurchaseDate(rs.getString(11));
			res.setPurchaseMoneyType(rs.getString(12));
			res.setContractItem(rs.getString(13));
			res.setRemark(rs.getString(14));
			res.setStatus(rs.getString("l_spqk"));
			res.setFirstApprover(rs.getString("l_spman"));
			if (rs.getString("l_fif").trim().equals("是")) {
				res.setToSencondApprove(true);
			} else {
				res.setToSencondApprove(false);
			}
			res.setSecondApprover(rs.getString("l_fspman"));
			if (rs.getString("l_firspif").trim().equals("是")) {
				res.setFirstApproved(true);
			} else {
				res.setFirstApproved(false);
			}
			res.setApproveOpinion(rs.getString("l_spyj"));
			res.setDealPlace(rs.getString("ponum"));
			res.setContactMan(rs.getString("lxr"));
			res.setReceiver(rs.getString("receiver"));
			res.setReceiverTel(rs.getString("receiver_tel"));
			res.setReceiverAddress(rs.getString("receiver_addr"));
			res.setFreight(rs.getString("freight"));
			res.setExpressCompany(rs.getString("express_company"));
			res.setAccountNo(rs.getString("acct"));
			res.setServiceType(rs.getString("service_type"));
			res.setPayway(rs.getString("pay_type"));
			res.setRate(rs.getString("rate"));
			res.setTransportationExpenseMoneyType(rs.getString("yfmoney"));
			res.setExchangePlace(rs.getString("jydd"));
			if (rs.getInt("self_carry") == 0) {
				res.setSelfPickup(true);
			} else {
				res.setSelfPickup(false);
			}
		}

		return res;
	}

	public List<PurchasingProduct> getPurchasingProductListByNumber(String number) {
		String sql = "select * from procure where number = ?";
		Map purchasing = this.jdbcTemplate.queryForMap(sql, new String[] { number });
		int id = ((Integer) purchasing.get("id")).intValue();

		sql = "select * from cgpro where ddid = ?";

		List<Map> purchasingProductList = this.jdbcTemplate.queryForList(sql, new Object[] { Integer.valueOf(id) });
		List<PurchasingProduct> result = new ArrayList<PurchasingProduct>();

		for (Map item : purchasingProductList) {
			PurchasingProduct product = new PurchasingProduct();
			product.setEpro((String) item.get("epro"));
			product.setNum(((Integer) item.get("num")).intValue());
			result.add(product);
		}

		return result;
	}

	public List<PurchasingProduct> getPurchasingProductListByParentId(String ddid) {
		return getPurchasingProductListByParentId(Integer.parseInt(ddid));
	}

	public List<PurchasingProduct> getPurchasingProductListByParentId(int ddid) {
		String sql = "select * from cgpro where ddid = ?";

		List<Map> purchasingProductList = this.jdbcTemplate.queryForList(sql, new Object[] { Integer.valueOf(ddid) });
		List<PurchasingProduct> result = new ArrayList<PurchasingProduct>();

		for (Map item : purchasingProductList) {
			PurchasingProduct product = new PurchasingProduct();
			product.setId(((Integer) item.get("id")).intValue());
			product.setEpro((String) item.get("epro"));
			product.setNum(((Integer) item.get("num")).intValue());
			product.setPro_number((String) item.get("pro_number"));
			product.setCpro((String) item.get("cpro"));
			product.setSupplier((String) item.get("supplier"));
			product.setCgpro_num(((Integer) item.get("cgpro_num")).intValue());
			product.setWid((String) item.get("wid"));
			product.setUnit((String) item.get("unit"));
			product.setHb((String) item.get("money"));
			product.setRate(String.valueOf(item.get("rate")));
			product.setCgpro_ydatetime((String) item.get("cgpro_ydatetime"));
			product.setRemark((String) item.get("remark"));
			product.setSale_rate((String) item.get("sale_rate"));

			result.add(product);
		}

		return result;
	}

	public PurchasingProduct getPurchasingProductListByNumberAndModel(String number, String model) {
		List<PurchasingProduct> purchasingProductList = getPurchasingProductListByNumber(number);
		PurchasingProduct result = null;
		for (PurchasingProduct product : purchasingProductList) {
			if (product.getEpro().equals(model)) {
				result = product;
				break;
			}
		}
		return result;
	}

	public void updatePurchasingStatus(String status, String number) {
		String sql = "update procure set l_spqk = ? where number = ?";
		this.jdbcTemplate.update(sql, new Object[] { status, number });
	}

	public void addPrintLog(String username, String number) {
		String sql = "insert into [print_log](operator,number,[created_time]) values(?,?,getdate())";
		this.jdbcTemplate.update(sql, new Object[] { username, number });
	}

	public List<Map<String, Object>> showPrintHistory(String number) {
		String sql = "select * from [print_log] where number = ?";
		return this.jdbcTemplate.queryForList(sql, new Object[] { number });
	}
}
