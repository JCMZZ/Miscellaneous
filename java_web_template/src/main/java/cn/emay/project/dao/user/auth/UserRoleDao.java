package cn.emay.project.dao.user.auth;

import java.util.List;

import cn.emay.project.dao.base.BaseSuperDao;
import cn.emay.project.pojo.auth.UserRole;

/**
 * @author frank
 */
public interface UserRoleDao extends BaseSuperDao<UserRole> {

	/**
	 * 获取角色的用户数量
	 */
	public long getNotDeleteUserCountByRole(Long roleId);

	/**
	 * 查询用户的所有角色
	 */
	public List<UserRole> findByUserId(Long userId);

	/**
	 * 删除用户的所有角色
	 */
	public void deleteByUserId(Long id);

}