package cn.emay.project.service.user;

import cn.emay.common.Result;
import cn.emay.common.db.Page;
import cn.emay.project.dto.auth.AuthTree;
import cn.emay.project.pojo.auth.Role;

/**
 * @author frank
 */
public interface UserAuthService {

	public Page<Role> findPage(int start, int limit);

	public Result addRole(String pageAuthIds, String operAuthIds, String roleName);

	public Result modifyRole(String pageAuthIds, String operAuthIds, String roleName, Long roleId);

	public Result deleteRole(Long roleId);

	public Result findAllAuthByRoleId(Long roleId);

	public AuthTree findSystemAuthTree();
	
	public AuthTree findUserAuthTree(Long userId);

}