package cn.emay.project.dao.user.auth.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.emay.common.db.Page;
import cn.emay.project.dao.base.BaseSuperDaoImpl;
import cn.emay.project.dao.user.auth.RoleDao;
import cn.emay.project.pojo.auth.AuthOper;
import cn.emay.project.pojo.auth.AuthPage;
import cn.emay.project.pojo.auth.Role;
import cn.emay.project.pojo.auth.RoleAuth;

/**
 * @author frank
 */
@Repository
public class RoleDaoImpl extends BaseSuperDaoImpl<Role> implements RoleDao {

	@Override
	public Page<Role> findPage(int start, int limit) {
		String hql = FIND_ALL_HQL + " where isDelete != true order by id asc";
		return this.getPageResult(hql, start, limit, null, Role.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AuthPage> findAllPageAuth(Long roleId) {
		String hql = " select p from AuthPage p , RoleAuth ra where p.id = ra.authId and ra.roleId = :roleId and ra.type = :pagetype";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", roleId);
		map.put("pagetype", RoleAuth.AUTH_TYPE_PAGE);
		return (List<AuthPage>) this.getListResult(hql, map);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AuthOper> findAllOperAuth(Long roleId) {
		String hql = " select p from AuthOper p , RoleAuth ra where p.id = ra.authId and ra.roleId = :roleId and ra.type = :pagetype";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", roleId);
		map.put("pagetype", RoleAuth.AUTH_TYPE_OPER);
		return (List<AuthOper>) this.getListResult(hql, map);
	}

}