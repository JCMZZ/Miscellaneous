package cn.emay.project.dao.user.auth;

import java.util.List;

import cn.emay.common.db.Page;
import cn.emay.project.dao.base.BaseSuperDao;
import cn.emay.project.pojo.auth.AuthOper;
import cn.emay.project.pojo.auth.AuthPage;
import cn.emay.project.pojo.auth.Role;

/**
 * @author frank
 */
public interface RoleDao extends BaseSuperDao<Role> {

	/**
	 * 分页查询
	 */
	public Page<Role> findPage(int start, int limit);

	public List<AuthPage> findAllPageAuth(Long roleId);

	public List<AuthOper> findAllOperAuth(Long roleId);

}