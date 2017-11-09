package cn.edu.zjut.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import cn.edu.zjut.po.Customer;
import cn.edu.zjut.service.IUserService;

public class SpringEnvTest {
	public static void main(String[] args){
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		IUserService userService=(IUserService) ctx.getBean("userService");
		Customer cust=new Customer();
		cust.setAccount("SPRING");
		cust.setPassword("SPRING");
		userService.register(cust);
		//ICustomerDAO userDao=(ICustomerDAO) ctx.getBean("userDAO");
	    //userDao.save();
	}

}
