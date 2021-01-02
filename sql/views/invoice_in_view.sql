SELECT     dbo.payment_invoice_in.id, dbo.payment_invoice_in.number, dbo.payment_invoice_in.amount, dbo.payment_invoice_in.memo, CONVERT(varchar(100), 
                      dbo.payment_invoice_in.receive_time, 23) AS receive_time, dbo.payment_invoice_in.payment_id, dbo.payment.contract, dbo.payment.orderform, 
                      dbo.payment.sup_number, dbo.payment.supplier, dbo.payment.pay_je, dbo.payment.htmoney, dbo.payment.yjfkdate, dbo.payment.sjfkdate, 
                      dbo.payment.moneytypes, dbo.payment.note, dbo.payment.bank, dbo.payment.moneyty, dbo.payment.wtfk, dbo.payment.states, dbo.payment.remark, 
                      dbo.procure.ponum, dbo.procure.sub, dbo.procure.number AS procure_number
FROM         dbo.payment INNER JOIN
                      dbo.payment_invoice_in ON dbo.payment.id = dbo.payment_invoice_in.payment_id INNER JOIN
                      dbo.procure ON dbo.payment.contract = dbo.procure.number