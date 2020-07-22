package com.dxd.service.news.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxd.dao.NewsMapper;
import com.dxd.pojo.EasybuyNews;
import com.dxd.service.news.NewsService;
import com.dxd.utils.Pager;


/**
 * 资讯列表业务逻辑层实现类！
 * @author Administrator
 *
 */
@Service("newsService")
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsMapper newsmapper;
	

	/**
	 * 获取资讯列表业务！
	 * @param pager
	 * @return
	 */
	public List<EasybuyNews> queryNewsList(Pager pager) {
		return newsmapper.queryNewsList(pager);
	}

	@Override
	/**
	 * 获取资讯列表总记录数业务！
	 * @return
	 */
	public int getTotalCount() {
		return newsmapper.getTotalCount();
	}
	
	/**
	 * 根据ID获取资讯列表详情业务！
	 * @param id
	 * @return
	 */
	public EasybuyNews findNewsById(int id) {
		return newsmapper.getNewsById(id);
	}

}
