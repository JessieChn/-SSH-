package cn.edu.zjut.po;
import java.util.ArrayList;
import java.util.List;

public class PageBean {
	private int allRowCounts; //总记录数
	private int pageSize; //每页记录数
	private int curPage; //当前页
	private int sumPages; //总页数
	public List<Book> books = new ArrayList<Book>();
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	public List<Customer> customers = new ArrayList<Customer>();
	public static int curPage(int page){  //获取当前页数
		return page == 0 ? 1 : page;
	}
	public static int curOffset(int pageSize,int curPage){ //获取当前页的起始记录数
		return pageSize * (curPage - 1);
	}
	public static int getSumPages(int allRowCounts,int pageSize){ //获取总页数
		return allRowCounts % pageSize ==0 ? allRowCounts/pageSize:(allRowCounts/pageSize+1);
	}
	public int getAllRowCounts() {
		return allRowCounts;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getCurPage() {
		return curPage;
	}
	public int getSumPages() {
		return sumPages;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setAllRowCounts(int allRowCounts) {
		this.allRowCounts = allRowCounts;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public void setSumPages(int sumPages) {
		this.sumPages = sumPages;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	

}
