package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class MemberDAO {
	
	Dbmain db = new Dbmain();
	
	//아이디 중복체크
	//아이디를 찾아서 있으면 true 없으면 false값 반환.
	
	public boolean searchId(String id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		//select문은 resultset무조건 들어감. 조회해야하니.
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
			//3개 바인딩
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
///////////////////////////////전체 출력
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
	/////////////////////////////// 맞는지 안맞는지
	public boolean isEqualPass(String num, String pass)
	{
		boolean flag = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*where뒤에는 ,가 아닌 and로 구분할 것*/
		String sql = "select * from member where num=? and pass=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//파라메타 값이 아니니 ""로 안묶어도 됨
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			//비밀번호가 맞는 데이터가 있으면 true
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
		////////////////////////수정하려는 하나의 데이터 가져오기
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
/////////////////////////////회원가입 폼을 수정하는 메서드
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
	///////////////////////////// 삭제
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
	/////////////////로그인 했을때 id를 이용한 name 구하기
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
	///////////////////////////////////아이디 비번 맞는지 확인
	public boolean isLogin(String id, String pass)
	{
		boolean flag = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*where뒤에는 ,가 아닌 and로 구분할 것*/
		String sql = "select * from member where id=? and pass=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//파라메타 값이 아니니 ""로 안묶어도 됨
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			//비밀번호가 맞는 데이터가 있으면 true
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

	

