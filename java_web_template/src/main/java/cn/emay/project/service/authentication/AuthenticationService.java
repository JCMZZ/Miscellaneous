package cn.emay.project.service.authentication;

import cn.emay.project.dto.authentication.AuthenticationCell;
import cn.emay.project.dto.authentication.Ticket;

/**
 * 认证服务 <br/>
 * 票据发放基于认证服务
 * 
 * @author 东旭
 *
 */
public interface AuthenticationService {

	public Ticket authentication(AuthenticationCell authenticationCell);

	public Ticket check(String token);

	public Ticket checkAndReflush(String token);

	public boolean remove(String token);

}
