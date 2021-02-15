package cn.emay.project.dao.user.auth;

import java.util.List;

import cn.emay.project.dao.base.BaseSuperDao;
import cn.emay.project.pojo.auth.Navigation;

/**
 * @author frank
 */
public interface NavigationDao extends BaseSuperDao<Navigation> {

	/**
	 * 按照顺序查找全部
	 */
	public List<Navigation> findAllOrderByIndex();

}