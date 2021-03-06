package cn.emay.project.dao.user.auth.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.emay.project.dao.base.BaseSuperDaoImpl;
import cn.emay.project.dao.user.auth.UserRoleDao;
import cn.emay.project.pojo.auth.UserRole;
import cn.emay.project.pojo.user.User;

/**
 * @author frank
 */
@Repository
public class UserRoleDaoImpl extends BaseSuperDaoImpl<UserRole> implements UserRoleDao {

	@Override
	public long getNotDeleteUserCountByRole(Long roleId) {
		String hql = "select count(r) from UserRole r,User u where u.id = r.userId and u.state != :deletestate " + "and r.roleId = :roleId ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("deletestate", User.STATE_DELETE);
		param.put("roleId", roleId);
		return (Long) this.getUniqueResult(hql, param);
	}

	@Override
	public List<UserRole> findByUserId(Long userId) {
		return this.findListByProperty("userId", userId);
	}

	@Override
	public void deleteByUserId(Long userId) {
		String hql = "delete UserRole where userId = :userId";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userId", userId);
		this.execByHql(hql, param);
	}

}