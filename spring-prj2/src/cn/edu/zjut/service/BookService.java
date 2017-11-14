package cn.edu.zjut.service;

import cn.edu.zjut.po.PageBean;

public interface BookService {
	public PageBean queryForPage(int pageSize,int page);


}
