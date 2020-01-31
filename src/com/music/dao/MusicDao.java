package com.music.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.music.entity.Music;
import com.music.util.DBUtils;

public class MusicDao {
	/**
	 * 查询全部歌单
	 */
	public List<Music> findMusic(){
		List<Music> musics = new ArrayList<Music>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConn();
			ps = conn.prepareStatement("select*from music");
			rs = ps.executeQuery();
			while(rs.next()) {
				Music music = new Music();
				music.setId(rs.getInt("id"));
				music.setTitle(rs.getString("title"));
				music.setSinger(rs.getString("singer"));
				music.setTime(rs.getDate("time"));
				music.setUrl(rs.getString("url"));
				music.setUserid(rs.getInt("userid"));
				musics.add(music);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally {
			DBUtils.getClose(conn, ps, rs);
		}
				
		return musics;
	}
	
	
	/**
	 * 根据关键字查询歌单
	 */
	public List<Music> ifMusic(String str){
		List<Music> musics = new ArrayList<Music>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConn();
			ps = conn.prepareStatement("select*from music where title like '%"+str+"%'");
			rs = ps.executeQuery();
			while(rs.next()) {
				Music music = new Music();
				music.setId(rs.getInt("id"));
				music.setTitle(rs.getString("title"));
				music.setSinger(rs.getString("singer"));
				music.setTime(rs.getDate("time"));
				music.setUrl(rs.getString("url"));
				music.setUserid(rs.getInt("userid"));
				musics.add(music);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			DBUtils.getClose(conn, ps, rs);
		}
		return musics;
	}
	
}
