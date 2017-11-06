package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.dao.BookDao;
import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.PageBean;
import cn.edu.zjut.service.BookService;

public class BookServiceImpl implements BookService{
	private BookDao bookDao;

	public BookDao getBookDao() {
		return bookDao;
	}

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	@Override
	public PageBean queryForPage(int pageSize, int page) {
		// TODO 自动生成的方法存根
		String hql = "from Book book";
		int allRowCounts = bookDao.findAllRowCounts(hql);
		int curPage = PageBean.curPage(page);
		int curOffset = PageBean.curOffset(pageSize, curPage);
		int sumPages = PageBean.getSumPages(allRowCounts, pageSize);
		List<Book> books = bookDao.findForPage(hql, curOffset, pageSize);
		PageBean pageBean = new PageBean();
		pageBean.setAllRowCounts(allRowCounts);
		pageBean.setCurPage(curPage);
		pageBean.setSumPages(sumPages);
		pageBean.setBooks(books);
		return pageBean;
	}

}
