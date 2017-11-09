package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import cn.edu.zjut.dao.BookDao;
import cn.edu.zjut.po.Book;
import com.opensymphony.xwork2.ActionContext;

public class BookDaoImpl implements BookDao {
	public BookDaoImpl(){
		
	}

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Book> findForPage(String hql, int off, int len) {
		// TODO 自动生成的方法存根
		boolean siftornot = true;
		String a = "";
		Session session = sessionFactory.openSession();
		Object filb =  ActionContext.getContext().getSession().get("filter_book");
		System.out.println("filb: DAO中~~~"+filb);
		if(filb==null||filb.equals(""))
		    siftornot = false;
		a = (String)filb;
		System.out.println("a: DAO中~~~"+a);
		String name=" where name like ?";
		Query query;
		if(siftornot)
		{
			hql = hql + name;
	        query = session.createQuery(hql);
            query.setParameter(0, "%" + a + "%");
		}
		else
            query = session.createQuery(hql);
		query.setFirstResult(off);
		query.setMaxResults(len);
		List<Book> books = query.list();
		session.close();
		return books;
	}

	@Override
	public int findAllRowCounts(String hql) {
		boolean siftornot = true;
		String a = "";
		Session session = sessionFactory.openSession();
		Object filb =  ActionContext.getContext().getSession().get("filter_book");
		System.out.println("filb: DAO中~~~"+filb);
		if(filb==null||filb.equals(""))
		    siftornot = false;
		a = (String)filb;
		System.out.println("a: DAO中~~~"+a);
		String name=" where name like ?";
		Query query;
		if(siftornot)
		{
			hql = hql + name;
	        query = session.createQuery(hql);
	        query.setParameter(0, "%" + a + "%");
	        System.out.println(hql);
		}
		else
            query = session.createQuery(hql);
        return query.list().size();
	}

}
