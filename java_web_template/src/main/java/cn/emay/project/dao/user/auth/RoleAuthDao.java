package cn.emay.project.dao.user.auth;

import java.util.List;

import cn.emay.project.dao.base.BaseSuperDao;
import cn.emay.project.pojo.auth.RoleAuth;

/**
 * @author frank
 */
public interface RoleAuthDao extends BaseSuperDao<RoleAuth> {

	/**
	 * 删除角色的所有权限
	 */
	public void deleteByRoleId(Long id);

	/**
	 * 查询角色的所有权限
	 */
	public List<RoleAuth> findByRoleId(Long id);

}