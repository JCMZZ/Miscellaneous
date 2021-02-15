package cn.emay.project.dao.user.auth.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.emay.project.dao.base.BaseSuperDaoImpl;
import cn.emay.project.dao.user.auth.RoleAuthDao;
import cn.emay.project.pojo.auth.RoleAuth;

/**
 * @author frank
 */
@Repository
public class RoleAuthDaoImpl extends BaseSuperDaoImpl<RoleAuth> implements RoleAuthDao {

	@Override
	public void deleteByRoleId(Long id) {
		String hql = " delete  RoleAuth where roleId = :roleId ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("roleId", id);
		this.execByHql(hql, param);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RoleAuth> findByRoleId(Long id) {
		String hql = "from RoleAuth where roleId =:roleId";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("roleId", id);
		return (List<RoleAuth>) this.getListResult(hql, param);
	}

}