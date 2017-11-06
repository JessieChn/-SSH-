package cn.edu.zjut.dao;
import cn.edu.zjut.po.Customer;
import java.util.ArrayList;
import java.util.List;

public interface ICustomerDAO {
       void save(Customer transientInstance);
       List get();
       List getById(String id);
       void update(Customer transientInstance);
       void delete(String id);
	   Boolean login(Customer transientInstance);
       
}

