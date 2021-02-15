package cn.emay.project.dao.user;

import cn.emay.common.db.Page;
import cn.emay.project.dao.base.BaseSuperDao;
import cn.emay.project.pojo.user.User;

public interface UserDao extends BaseSuperDao<User> {
	/**
	 * 根据用户名查询用户
	 */
	public User findByUserName(String username);

	/**
	 * 分页查询
	 */
	public Page<User> findPage(int start, int limit, String userName, int state);

}
