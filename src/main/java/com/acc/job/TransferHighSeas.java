package com.acc.job;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


/**
 * 转移公海定时任务
 * @author TANGCY
 *
 */
@Component("transferHighSeas")
public class TransferHighSeas {
	
	
	/**
	 * 执行转移公海的任务 0 0 1 * * ? 每天1点执行
	 */
	@Scheduled(cron = "0 0 1 * * ?")
	public void execute () {
		System.out.println("===> 执行转移公海任务");
//		UserInfoQuery query = new UserInfoQuery();
//		query.setSelState("6");
//		String createDateEndString = CalendarUtil.addDay(CalendarUtil.getCurrentDate(),-60);
//		query.setCreateDateEndString(createDateEndString);
//		try {
//			List<Integer> idlist = new ArrayList<Integer>();
//			Page<AccCustomer> page = accCustomerService.selectPageMore(query);
//			if(page!=null && page.getResult()!=null&&page.getResult().size()>0){
//				List<AccCustomer> accCustomerList = page.getResult();
//				for (int i = 0; i < accCustomerList.size(); i++) {
//					idlist.add(accCustomerList.get(i).getId());
//				}
//				if(idlist.size()>0){
//					Map<String, Object> map = new HashMap<String, Object>();
//					map.put("state", "2");
//					map.put("ownerId", "");
//					map.put("ids", idlist);
//					accCustomerService.transferCustomer(map);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
}
