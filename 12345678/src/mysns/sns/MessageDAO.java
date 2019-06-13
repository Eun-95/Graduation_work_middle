package mysns.sns;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import mysns.util.*;

public class MessageDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public ArrayList<MessageSet> getAll(int cnt, String suid) {
		ArrayList<MessageSet> datas = new ArrayList<MessageSet>();
		conn = DBManager.getConnection();
		String sql;

		try {
			/*�슖�돦裕꾬옙�쟽�뜝�럩逾� �뜝�럥由썲뜝�럡�뀬�뜝�럩肉뷴뜝�럩踰� �뼨�먯삕�뜝�럩諭� 嶺뚮ㅄ維곲뇡占� �솻洹λ닁癰귥눦�삕繹먲옙 �뜝�럥�닡�뜝�럥鍮띸춯濡녹삕 �윜諛몄굡繹먲옙 �뜝�럩�쓧嶺뚳퐦�삕 �뇦猿딆뒩占쎈뻣占쎈닱占쎈닔占쎈굵 �뜝�럥堉꾤솻洹λ닁占쎈쐲�뜝�럩逾ζ뤆�룊�삕 �뇦猿됲�ｏ옙�젧�뜝�럥由��뜝�럥裕됮뇦猿볦삕*/
			if((suid == null) || (suid.equals(""))) {
				sql = "select * from s_message order by date desc limit 0,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
			}
			
			else{
				sql = "select * from s_message where uid=? order by date desc limit 0,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,suid);
				pstmt.setInt(2,cnt);
			}

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageSet ms = new MessageSet();
				Message m = new Message();
				ArrayList<Reply> rlist = new ArrayList<Reply>(); /*�뤆�룄�궖�뚳옙 �뇦猿딆뒩占쎈뻣占쎈닱占쎈닑壤쏅쪋�삕占쎈펲 占쎈꽞占쎈열�뇡�꼻�삕占쎈뭵 �뜝�룞�삕 �뜝�럥�냺�뼨�먯삕�뜝�럩逾� �뜝�럥堉꾬옙紐댐옙占썲뜝�뜽�뿉�뜝占� 占쎈／占쎈쐝�뵳怨ㅼ삕占쎈꼨*/
				ArrayList<Goods> glist = new ArrayList<Goods>(); /*�뤆�룄�궖�뚳옙 �뇦猿딆뒩占쎈뻣占쎈닱占쎈닑壤쏅쪋�삕占쎈펲 占쎈꽞占쎈열�뇡�꼻�삕占쎈뭵 �뜝�룞�삕 �뜝�럥�냺�뼨�먯삕�뜝�럩逾� �뜝�럥堉꾬옙紐댐옙占썲뜝�뜽�뿉�뜝占� 占쎈／占쎈쐝�뵳怨ㅼ삕占쎈꼨*/
				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setDate(rs.getDate("date")+" / "+rs.getTime("date"));
				m.setUid(rs.getString("uid"));
				m.setImg(rs.getString("img"));
				String rsql = "select *  from s_reply where mid=? order by date desc";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1,rs.getInt("mid"));
				ResultSet rrs = pstmt.executeQuery();
				while(rrs.next()) {
					Reply r = new Reply();
					r.setRid(rrs.getInt("rid"));
					r.setUid(rrs.getString("uid"));
					r.setRmsg(rrs.getString("rmsg"));
					r.setDate(rrs.getDate("date")+"/"+rrs.getTime("date"));
					rlist.add(r);
				}
				String gsql="select * from goods where mid=?";
				pstmt = conn.prepareStatement(gsql);
				pstmt.setInt(1,rs.getInt("mid"));
				ResultSet grs = pstmt.executeQuery();
				while(grs.next()) {
					Goods g=new Goods();
					g.setMid(grs.getInt(1));
					g.setUid(grs.getString(2));
					glist.add(g);
				}
				
				m.setFavcount(glist.size()); /*占쎈꽞占쎈열�뇡�꼻�삕占쎈뭵 �뤆�룊�삕�뜝�럥�빢�뜝�룞�삕�뜝�럩�궋*/
				m.setReplycount(rlist.size()); /*�뜝�럥�냺�뼨�먯삕 �뤆�룊�삕�뜝�럥�빢 �뜝�룞�삕�뜝�럩�궋*/
				
				ms.setMessage(m);
				ms.setRlist(rlist); /*�뜝�럥�냺�뼨�먯삕占쎈뎨占쎈봾裕욃뜝�럥諭쒎뜝�럥援�*/
				ms.setGlist(glist); /*占쎈꽞占쎈열�뇡�꼻�삕占쎈뭵 占쎈뎨占쎈봾裕욃뜝�럥諭쒎뜝�럥援�*/
				datas.add(ms); 
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		}
		finally {
			try {
				
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getErrorCode());
			}
		}		
		return datas;
	}
	
	
	public boolean newMsg(Message msg) {
		conn = DBManager.getConnection();
		String sql = "insert into s_message(uid, msg, date,img) values(?,?,now(),?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, msg.getUid());
			pstmt.setString(2, msg.getMsg());
			pstmt.setString(3, msg.getImg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;	
}
	
	
	public boolean newReply(Reply reply) {
		conn = DBManager.getConnection();
		String sql = "insert into s_reply(mid,uid,rmsg,date) values(?,?,?,now())";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getMid());
			pstmt.setString(2, reply.getUid());
			pstmt.setString(3, reply.getRmsg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	
	public boolean delReply(int rid) {
		conn = DBManager.getConnection();
		String sql = "delete from s_reply where rid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rid);;
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	public boolean delMsg(int mid) {
		conn = DBManager.getConnection();
		String sql="delete from goods where mid = ?";
		String sql1 = "delete from s_reply where mid = ?";
		String sql2 = "delete from s_message where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;	
	}
	
	
	public void favorite(int mid,String uid) throws SQLException {
		conn = DBManager.getConnection();
	
		
		try {
			String sql = "insert into goods values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.setString(2, uid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			String sql = "delete from goods where mid=? and uid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.setString(2, uid);
			pstmt.executeUpdate();
			
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public ArrayList<Goods> showfavor(int mid) {
		conn = DBManager.getConnection();
		
		ArrayList<Goods> g=new ArrayList<Goods>();
		try {
			
			String sql = "select * from goods where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Goods g1=new Goods();
				g1.setMid(rs.getInt(1));
				g1.setUid(rs.getString(2));
				g.add(g1);
			}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

		return g;	
		
	}
	
		
	}

