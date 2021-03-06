package cn.emay.project.dao.user.auth.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.emay.project.dao.base.BaseSuperDaoImpl;
import cn.emay.project.dao.user.auth.AuthPageDao;
import cn.emay.project.pojo.auth.AuthPage;
import cn.emay.project.pojo.auth.RoleAuth;

/**
 * @author frank
 */
@Repository
public class AuthPageDaoImpl extends BaseSuperDaoImpl<AuthPage> implements AuthPageDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<AuthPage> findAllOrderByIndex() {
		String hql = this.FIND_ALL_HQL + " order by index asc ";
		return (List<AuthPage>) this.getListResult(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AuthPage> findUserAuthPagesOrderByIndex(Long userId) {
		String hql = "select ap from  UserRole ur , RoleAuth ra , AuthPage ap where ur.userId = :userId and ra.roleId = ur.roleId and ra.type = :opertype and ra.authId = ap.id";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("opertype", RoleAuth.AUTH_TYPE_PAGE);
		return (List<AuthPage>) this.getListResult(hql, map);
	}

}