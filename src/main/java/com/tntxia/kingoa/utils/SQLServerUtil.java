package com.tntxia.kingoa.utils;

import java.util.Locale;

import com.tntxia.kingoa.common.entity.PageVO;

public class SQLServerUtil {
	
	// 生成分页的SQL语句
	public static String generatePagingSQL(String sql, String orderBy, PageVO pageVO) {
		sql = sql.toLowerCase(Locale.ENGLISH);
		int fromIndex = sql.indexOf(" from");
		String startSql = sql.substring(0, fromIndex);
		String endSql = sql.substring(fromIndex);
		return "select * from (" + startSql + ", ROW_NUMBER() OVER(Order by "+orderBy+" ) AS RowId " + endSql + ") as a where RowId between " + pageVO.getStart() + " and " + pageVO.getEnd();
	}
	
	public static void main(String[] args) {
		PageVO pageVO = new PageVO();
		pageVO.setPage(1);
		pageVO.setPageSize(10);
		String sql = "select *, procure.sub from payment left outer join procure on payment.orderform = procure.id  where  payment.wtfk like 'A%'";
		System.out.println(generatePagingSQL(sql, "payment.id desc", pageVO));
	}

}
