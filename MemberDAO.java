package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class MemberDAO {
	
	Dbmain db = new Dbmain();
	
	//���̵� �ߺ�üũ
	//���̵� ã�Ƽ� ������ true ������ false�� ��ȯ.
	
	public boolean searchId(String id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		//select���� resultset������ ��. ��ȸ�ؾ��ϴ�.
		ResultSet rs = null;
		
		
		boolean flag = false;
		String sql = "select * from member where id=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return flag;
	}
/////////////////////////////insert
	public void insertMember(MemberDTO dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into member values(seq_mini.nextval, ?, ?, ?, sysdate)";
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			//3�� ���ε�
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			
			pstmt.executeUpdate();

			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
///////////////////////////////��ü ���
	public Vector<MemberDTO> getMemberList()
	{
		Vector<MemberDTO> list = new Vector<MemberDTO>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member order by name asc";
		conn = db.getConnection();
		try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next())
				{
					MemberDTO dto = new MemberDTO();
					
					dto.setNum(rs.getString("num"));
					dto.setName(rs.getString("name"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setGaipday(rs.getTimestamp("gaipday"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					conn.close();
					stmt.close();
					rs.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return list;
		}
	/////////////////////////////// �´��� �ȸ´���
	public boolean isEqualPass(String num, String pass)
	{
		boolean flag = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*where�ڿ��� ,�� �ƴ� and�� ������ ��*/
		String sql = "select * from member where num=? and pass=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//�Ķ��Ÿ ���� �ƴϴ� ""�� �ȹ�� ��
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			//��й�ȣ�� �´� �����Ͱ� ������ true
			if(rs.next())
				flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
		////////////////////////�����Ϸ��� �ϳ��� ������ ��������
	public MemberDTO getData(String num)
	{
		MemberDTO dto = new MemberDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "select * from member where num=?";
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return dto;
	}
/////////////////////////////ȸ������ ���� �����ϴ� �޼���
	public void updateMember(MemberDTO dto)
	{
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		String sql = "update member set name=?, pass=? where num=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getNum());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	///////////////////////////// ����
	public void deleteMember(String num)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from member where num=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	/////////////////�α��� ������ id�� �̿��� name ���ϱ�
	public String getName(String id)
	{
		String name ="";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "select * from member where id=?";
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return name;
	}
	///////////////////////////////////���̵� ��� �´��� Ȯ��
	public boolean isLogin(String id, String pass)
	{
		boolean flag = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*where�ڿ��� ,�� �ƴ� and�� ������ ��*/
		String sql = "select * from member where id=? and pass=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//�Ķ��Ÿ ���� �ƴϴ� ""�� �ȹ�� ��
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			//��й�ȣ�� �´� �����Ͱ� ������ true
			if(rs.next())
				flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
	}

	

