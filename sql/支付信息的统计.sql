select payment.*, 
(select SUM(cgpro.selljg * num) from cgpro where cgpro.ddid = payment.orderform) total,
(select SUM(selljg * num) from cgpro where ddid in (select id from procure where l_spqk = '已入库' ) and  cgpro.ddid = payment.orderform) totalIn
 from payment