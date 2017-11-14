package cn.edu.zjut.dao;

import java.util.List;

import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;

public interface BookDao {
	public List<Book> findForPage(String hql,int off,int len); 
	           //输入hql语句，记录起始点off,和长度len来返回Book类型的数据
	public int findAllRowCounts(String hql);
	           //输入hql语句，查询记录总数。

}
