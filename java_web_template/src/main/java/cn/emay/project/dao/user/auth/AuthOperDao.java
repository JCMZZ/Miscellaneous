package cn.emay.project.dao.user.auth;

import java.util.List;

import cn.emay.project.dao.base.BaseSuperDao;
import cn.emay.project.pojo.auth.AuthOper;

/**
 * @author frank
 */
public interface AuthOperDao extends BaseSuperDao<AuthOper> {

	/**
	 * 按照顺序查找全部
	 */
	public List<AuthOper> findAllOrderByIndex();

	public List<AuthOper> findUserAuthOpersOrderByIndex(Long userId);

}