package cn.edu.zjut.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import cn.edu.zjut.dao.BookDao;
import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;
import javassist.bytecode.Descriptor.Iterator;

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
		boolean[] siftornot = {true,true,true,true,true,true,true};
		Query query = null;
		Map<String,String> map = new HashMap<String, String>();
		String fbns = "",fbts = "",fbds = "",fbwls = "",fbps ="",priceStr="";
		int fbpmins,fbpmaxs; //filter book 
		Session session = sessionFactory.openSession();
		Map<String, Object> httpSession =  ActionContext.getContext().getSession();
		Object fbn =  httpSession.get("filter_book");
		Object fbt =  httpSession.get("filter_type");
		Object fbd =  httpSession.get("filter_description");
		Object fbwl =  httpSession.get("filter_writerlocation");
		Object fbp =  httpSession.get("filter_press");
		Object fbpmin =  httpSession.get("filter_pricemin");
		Object fbpmax =  httpSession.get("filter_pricemax");
		if((fbn==null||fbn.equals("")))
			siftornot[0] = false;
		if((fbt==null||fbt.equals("")))
			siftornot[1] = false;
		if((fbd==null||fbd.equals("")))
			siftornot[2] = false;
		if((fbwl==null||fbwl.equals("")))
			siftornot[3] = false;
		if(fbp==null||fbp.equals(""))
			siftornot[4] = false;
		if(fbpmin==null||fbpmin.equals(""))
			fbpmins = 0;
		else
			fbpmins = Integer.parseInt(fbpmin.toString());
		if(fbpmax==null||fbpmax.equals(""))
			fbpmaxs = 99999;
		else
			fbpmaxs = Integer.parseInt(fbpmax.toString());			
		fbns = (String)fbn;
		fbts = (String)fbt;
		fbds = (String)fbd;
		fbwls = (String)fbwl;
		fbps = (String)fbp;
		System.out.print("转换测试~~~~~~");
		hql = hql + " where 1=1 ";
		String name=" and name like :name ";
		String type=" and type like :type ";
		String description=" and description like :description ";
		String writerLocation=" and writerLocation like :writerLocation ";
		String press=" and press like :press ";
		if(siftornot[0]){
			hql = hql + name;
			map.put("name",fbns);
		}
		if(siftornot[1]){
			hql = hql + type;
			map.put("type",fbts);
        }
	    if(siftornot[2]){
				hql = hql + description;
				map.put("description",fbds);
			}
		if(siftornot[3]){
		        hql = hql + writerLocation;
		        map.put("writerLocation",fbwls);
			}
		if(siftornot[4]){
				hql = hql + press;
				map.put("press",fbps);
			}
		    if((fbpmin==null||fbpmin.equals(""))&&(fbpmax==null||fbpmax.equals(""))){
			   
			   siftornot[5] = false;
			   siftornot[6] = false;
		    }
		    else if((fbpmin==null||fbpmin.equals(""))){
			  
			   priceStr = "and price <= :fbpmaxs";
		       siftornot[5] = false;
		    }
		    else if((fbpmax==null||fbpmax.equals(""))){
		       priceStr = "and price >= :fbpmins";
			   siftornot[6] = false;
		    }
		    else 
		    	priceStr = "and price between :fbpmins and :fbpmaxs";
		    hql = hql +priceStr;
			query = session.createQuery(hql);
			Set<String> keySet = map.keySet();
			java.util.Iterator<String> it = keySet.iterator();
			while(it.hasNext()){
				Object key = it.next();
				String keys = key.toString();
				Object value = map.get(key);
				query.setParameter(keys, "%" + value + "%");
			}
		    if(siftornot[5]==false&&siftornot[6]==false){
		    	System.out.println("test1");
		    }
		    else if(siftornot[5]==false){
		    	query.setInteger("fbpmaxs", fbpmaxs);
		    	System.out.println("test2");
		    }
		    else if(siftornot[6]==false){

		    	query.setInteger("fbpmins", fbpmins);
		    	System.out.println("test3");
		    }
		    else{

		    	query.setInteger("fbpmins",fbpmins);
		    	query.setInteger("fbpmaxs", fbpmaxs);

		    	
		    }
		query.setFirstResult(off);
		query.setMaxResults(len);
		List<Book> books = query.list();
		session.close();
		return books;
	}

	@Override
	public int findAllRowCounts(String hql) {
		boolean[] siftornot = {true,true,true,true,true,true,true};
		Query query = null;
		Map<String,String> map = new HashMap<String, String>();
		String fbns = "",fbts = "",fbds = "",fbwls = "",fbps ="",priceStr="";
		int fbpmins,fbpmaxs; //filter book 
		Session session = sessionFactory.openSession();
		Map<String, Object> httpSession =  ActionContext.getContext().getSession();
		Object fbn =  httpSession.get("filter_book");
		Object fbt =  httpSession.get("filter_type");
		Object fbd =  httpSession.get("filter_description");
		Object fbwl =  httpSession.get("filter_writerlocation");
		Object fbp =  httpSession.get("filter_press");
		Object fbpmin =  httpSession.get("filter_pricemin");
		Object fbpmax =  httpSession.get("filter_pricemax");
		if((fbn==null||fbn.equals("")))
			siftornot[0] = false;
		if((fbt==null||fbt.equals("")))
			siftornot[1] = false;
		if((fbd==null||fbd.equals("")))
			siftornot[2] = false;
		if((fbwl==null||fbwl.equals("")))
			siftornot[3] = false;
		if(fbp==null||fbp.equals(""))
			siftornot[4] = false;
		if(fbpmin==null||fbpmin.equals(""))
			fbpmins = 0;
		else
			fbpmins = Integer.parseInt(fbpmin.toString());
		if(fbpmax==null||fbpmax.equals(""))
			fbpmaxs = 99999;
		else
			fbpmaxs = Integer.parseInt(fbpmax.toString());			
		fbns = (String)fbn;
		fbts = (String)fbt;
		fbds = (String)fbd;
		fbwls = (String)fbwl;
		fbps = (String)fbp;
		System.out.print("转换测试~~~~~~");
		hql = hql + " where 1=1 ";
		String name=" and name like :name ";
		String type=" and type like :type ";
		String description=" and description like :description ";
		String writerLocation=" and writerLocation like :writerLocation ";
		String press=" and press like :press ";
		if(siftornot[0]){
			hql = hql + name;
			map.put("name",fbns);
		}
		if(siftornot[1]){
			hql = hql + type;
			map.put("type",fbts);
        }
	    if(siftornot[2]){
				hql = hql + description;
				map.put("description",fbds);
			}
		if(siftornot[3]){
		        hql = hql + writerLocation;
		        map.put("writerLocation",fbwls);
			}
		if(siftornot[4]){
				hql = hql + press;
				map.put("press",fbps);
			}
		    if((fbpmin==null||fbpmin.equals(""))&&(fbpmax==null||fbpmax.equals(""))){
			   
			   siftornot[5] = false;
			   siftornot[6] = false;
		    }
		    else if((fbpmin==null||fbpmin.equals(""))){
			  
			   priceStr = "and price <= :fbpmaxs";
		       siftornot[5] = false;
		    }
		    else if((fbpmax==null||fbpmax.equals(""))){
		       priceStr = "and price >= :fbpmins";
			   siftornot[6] = false;
		    }
		    else 
		    	priceStr = "and price between :fbpmins and :fbpmaxs";
		    hql = hql +priceStr;
			query = session.createQuery(hql);
			Set<String> keySet = map.keySet();
			java.util.Iterator<String> it = keySet.iterator();
			while(it.hasNext()){
				Object key = it.next();
				String keys = key.toString();
				Object value = map.get(key);
				query.setParameter(keys, "%" + value + "%");
			}
		    if(siftornot[5]==false&&siftornot[6]==false){
		    	System.out.println("test1");
		    }
		    else if(siftornot[5]==false){
		    	query.setInteger("fbpmaxs", fbpmaxs);
		    	System.out.println("test2");
		    }
		    else if(siftornot[6]==false){

		    	query.setInteger("fbpmins", fbpmins);
		    	System.out.println("test3");
		    }
		    else{

		    	query.setInteger("fbpmins",fbpmins);
		    	query.setInteger("fbpmaxs", fbpmaxs);

		    	
		    }
        return query.list().size();
	}


}
