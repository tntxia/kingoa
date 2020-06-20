package com.tntxia.kingoa.purchasing.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.tntxia.db.DBConnection;
import com.tntxia.kingoa.common.factory.NumberFactory;
import com.tntxia.kingoa.purchasing.dao.PurchasingRefundDao;
import com.tntxia.kingoa.purchasing.entity.RefundProduct;
import com.tntxia.oa.util.CommonAction;
import com.tntxia.oa.warehouse.Warehouse;
import com.tntxia.oa.warehouse.WarehouseManager;

public class RefundAction extends CommonAction {
	
	private PurchasingRefundDao purchasingRefundDao;
	
	private NumberFactory numberFactory;

	public void setPurchasingRefundDao(PurchasingRefundDao purchasingRefundDao) {
		this.purchasingRefundDao = purchasingRefundDao;
	}

	public void setNumberFactory(NumberFactory numberFactory) {
		this.numberFactory = numberFactory;
	}

	@SuppressWarnings("rawtypes")
	public ModelAndView purchasingRefundFromWarehouseSingle(HttpServletRequest request, HttpServletResponse arg1)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		DBConnection einfodb = new DBConnection();

		int id = ServletRequestUtils.getIntParameter(request, "id").intValue();

		RefundProduct refundProduct = this.purchasingRefundDao.getProductById(id);

		String purchasingNumber = refundProduct.getPurchasingNumber();

		String th_num = request.getParameter("th_num");
		String wid = request.getParameter("wid");

		WarehouseManager warehouseManager = new WarehouseManager();

		Warehouse query = new Warehouse();
		query.setId(Integer.valueOf(wid).intValue());
		Warehouse warehouse = warehouseManager.getWarehouseSingle(query);

		if (warehouse.getPro_num() < Integer.valueOf(th_num).intValue()) {
			result.put("success", Boolean.valueOf(false));
			result.put("message", "仓库数量少于退货数量！！");
			return new ModelAndView("common/result", result);
		}
		
		SimpleDateFormat simple = new SimpleDateFormat(
		         "yyyy-MM-dd");
		     String currentDate = simple.format(new Date());
		
		Map refund = purchasingRefundDao.getRefund(refundProduct.getDdid());
	    String th_number = (String) refund.get("number");
	    String coname = (String) refund.get("coname");
	    String co_number = (String) refund.get("co_number");
	    String pro_number = (String) refund.get("fypronum");
	    String fy_states = (String) refund.get("fy_states");
	    
	    String number = numberFactory.generateNumber("OH");
		
		String strSQLq = "insert into outhouse([pro_fynum],[pro_coname],[pro_model],[pro_name],[pro_num],[pro_unit],[pro_supplier],[pro_datetime],[pro_number],[slinkman],[slinktel],[states],[ddid],[remark],[wid],[pro_coname_num],[pro_rate_types],[pro_rate],[pro_out_num],[in_no]) values('" + 
 
         
			th_number + 
         "','" + 
         coname + 
         "','" + 
         refundProduct.getEpro() + 
         "','" + 
         refundProduct.getCpro() + 
         "','" + 
         th_num + 
         "','" + 
         refundProduct.getUnit() + 
         "','" + 
         refundProduct.getTradeMark() + 
         "','" + 
         currentDate + 
         "','-" + 
         pro_number + 
         "','','','已出库','" + 
         id + 
         "','" + 
         fy_states + 
         "','2','" + 
         co_number + 
         "','" + 
         wid + 
         "','0','" + 
         number + "', 0)";
       boolean tq = einfodb.executeUpdate(strSQLq);
       if (!tq) {
         result.put("success", Boolean.valueOf(false));
         result.put("message", "更新库存失败,你所输入的内容超出系统范围或输入类型不符!");
         return new ModelAndView("common/result", result);
       } 

		String strSQLwf = "update  th_pro_supplier set s_num=s_num+" + th_num + " where id='" + id + "' ";
		boolean twf = einfodb.executeUpdate(strSQLwf);
		if (!twf) {
			result.put("success", Boolean.valueOf(false));
			result.put("message", "更新退货产品失败,你所输入的内容超出系统范围或输入类型不符!");
			return new ModelAndView("common/result", result);
		}

		String strSQLw = "update warehouse set pro_num=pro_num-" + th_num + " where id=" + wid;
		boolean tw = einfodb.executeUpdate(strSQLw);
		if (!tw) {
			result.put("success", Boolean.valueOf(false));
			result.put("message", "更新库存失败,你所输入的内容超出系统范围或输入类型不符!");
			return new ModelAndView("common/result", result);
		}

		String sql = "update procure set l_spqk = '部分退货' where number = '" + purchasingNumber + "'";
		tw = einfodb.executeUpdate(sql);
		if (!tw) {
			result.put("success", Boolean.valueOf(false));
			result.put("msg", "更新采购订单状态失败,你所输入的内容超出系统范围或输入类型不符!");
			return new ModelAndView("common/result", result);
		}

		einfodb.close();

		result.put("success", Boolean.valueOf(true));
		result.put("msg", "退货成功");

		return new ModelAndView("common/result", result);
	}

}
