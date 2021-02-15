package cn.emay.project.dao.user.auth;

import java.util.List;

import cn.emay.project.dao.base.BaseSuperDao;
import cn.emay.project.pojo.auth.AuthPage;

/**
 * @author frank
 */
public interface AuthPageDao extends BaseSuperDao<AuthPage> {

	/**
	 * 按照顺序查找全部
	 */
	public List<AuthPage> findAllOrderByIndex();

	public List<AuthPage> findUserAuthPagesOrderByIndex(Long userId);

}