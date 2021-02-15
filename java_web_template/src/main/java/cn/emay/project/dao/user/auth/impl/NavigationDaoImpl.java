package cn.emay.project.dao.user.auth.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.emay.project.dao.base.BaseSuperDaoImpl;
import cn.emay.project.dao.user.auth.NavigationDao;
import cn.emay.project.pojo.auth.Navigation;

/**
 * @author frank
 */
@Repository
public class NavigationDaoImpl extends BaseSuperDaoImpl<Navigation> implements NavigationDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Navigation> findAllOrderByIndex() {
		String hql = this.FIND_ALL_HQL + " order by index asc ";
		return (List<Navigation>) this.getListResult(hql);
	}

}