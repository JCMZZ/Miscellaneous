package cn.emay.project.dao.user.auth.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.emay.project.dao.base.BaseSuperDaoImpl;
import cn.emay.project.dao.user.auth.AuthOperDao;
import cn.emay.project.pojo.auth.AuthOper;
import cn.emay.project.pojo.auth.RoleAuth;

/**
 * @author frank
 */
@Repository
public class AuthOperDaoImpl extends BaseSuperDaoImpl<AuthOper> implements AuthOperDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<AuthOper> findAllOrderByIndex() {
		String hql = this.FIND_ALL_HQL + " order by index asc ";
		return (List<AuthOper>) this.getListResult(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AuthOper> findUserAuthOpersOrderByIndex(Long userId) {
		String hql = "select ao from  UserRole ur , RoleAuth ra , AuthOper ao where ur.userId = :userId and ra.roleId = ur.roleId and ra.type = :opertype and ra.authId = ao.id";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("opertype", RoleAuth.AUTH_TYPE_OPER);
		return (List<AuthOper>) this.getListResult(hql, map);
	}

}