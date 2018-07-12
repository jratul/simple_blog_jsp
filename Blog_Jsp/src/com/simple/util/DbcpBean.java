package com.simple.util;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
 *  Data Base Connection Pool Bean
 *  
 *  - DataBase �� access �ؼ� �۾��Ϸ��� Connection ��ü�� �ʿ��ϴ�.
 *  - Connection ��ü�� connection pool �� �̸� ����� ���� �ʿ��Ҷ� ����
 *    ����ϰ� �ݳ��ϴ� ������ ����ؾ��Ѵ�. 
 *  - DbcpBean ��ü���� �������ִ� Connection ��ü�� ����ϰ� .close() 
 *    �޼ҵ带 ȣ���ϸ� �ڵ����� �ݳ��ȴ�.
 *    
 *     1. Servers/context.xml ����
 *     
 *      <Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
              username="scott" password="tiger" maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/>
              
      	2. WEB-INF/web.xml ����
      	<resource-ref>
			<description>Oracle Datasource example</description>
			<res-ref-name>jdbc/myoracle</res-ref-name>
			<res-type>javax.sql.DataSource</res-type>
			<res-auth>Container</res-auth>
		</resource-ref>
		
		3. DbcpBean Ŭ���� �Ʒ��� ���� �ۼ�
		
		4. Dao ����
		Connection conn = new DbcpBean().getConn();
		�� ���� �������� Connection ��ü�� ������ ����
 *     
 */
public class DbcpBean {
	//�ʵ�
	private Connection conn;
	//������
	public DbcpBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			System.out.println("Connection ������ ����");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//Connection ��ü�� �������ִ� �޼ҵ�
	public Connection getConn() {
		return conn;
	}
}