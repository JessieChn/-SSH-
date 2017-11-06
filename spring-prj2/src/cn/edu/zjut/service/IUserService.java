package cn.edu.zjut.service;


import java.util.List;

import cn.edu.zjut.po.Customer;

public interface IUserService {
	public void register(Customer transientInstance);
	public List getCustomerInfo();
	public List getCustomerInfoById(String id);
	public void customerInfoUpdate(Customer transientInstance);
	public void customerInfoDelete(String id);
	public Boolean login(Customer loginUser);

}
