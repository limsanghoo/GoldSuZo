package com.zagle.service.stream.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.WriteConcern;
import com.zagle.common.Search;
import com.zagle.service.domain.Stream;
import com.zagle.service.stream.StreamRestDao;

@Repository("MongoRestDaoImpl")
public class MongoRestDaoImpl implements StreamRestDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(":: "+getClass()+" setSqlSession() Call.......");
		this.sqlSession = sqlSession;
	}
	
	public MongoRestDaoImpl() {
System.out.println(getClass()+"constructor call");		
	}
	
	@Override
	public List<JSONObject> listMongo(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();	
		List<JSONObject> list2 = new ArrayList<JSONObject>();
			try {
			
			MongoClientURI uri  = new MongoClientURI("mongodb://localhost:27017/stream"); 
	        MongoClient mongoClient = new MongoClient(uri);
	        DB db = mongoClient.getDB(uri.getDatabase());
			System.out.println("MONGODB SUCCESS");
			
			DBCollection dbcoll = db.getCollection("streams");
			
			WriteConcern w = new WriteConcern(1,2000);
			 mongoClient.setWriteConcern(w);
		       
		       DBCursor cursor = dbcoll.find().skip(search.getStartRowNum()-1).limit(search.getEndRowNum());
		        while(cursor.hasNext()){
		
		       list.add(""+cursor.next());
		        }
		        
		        JSONParser parser = new JSONParser();
		        JSONObject obj = new JSONObject();
		        
		        
		        
		        for(String str:list) {
			        obj = (JSONObject)parser.parse(str);
			        list2.add(obj);
		        }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list2;
		}


	@Override
	public void addMongo(Stream stream) throws Exception {
	
		System.out.println("StreamRestDao입니다");
		MongoClientURI uri = new MongoClientURI("mongodb://localhost:27017/stream");
		MongoClient mongoClient = new MongoClient(uri);
		DB db = mongoClient.getDB(uri.getDatabase());
		
		System.out.println("몽고디비 성공");
		
		DBCollection dbcoll = db.getCollection("streams");
		
		WriteConcern w = new WriteConcern(1,2000);
		mongoClient.setWriteConcern(w);
		
		BasicDBObject addObject = new BasicDBObject();
		
		addObject.put("streamer",stream.getStreamNo());
		addObject.put("streamerProfile", stream.getUser().getProfile());
		addObject.put("streamNickname", stream.getUser().getUserNickname());
		addObject.put("streamTitle",stream.getStreamTitle());
		addObject.put("streamContent", stream.getStreamContent());
		addObject.put("streamLikeCount",0);
		addObject.put("streamViewCount",0);
		
	    dbcoll.insert(addObject);
        mongoClient.close();       
	}

	@Override
	public Map<String, Object> kakaopayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> naverpayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> inicispayStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> kakaopayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> naverpayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> inicispayOkStream(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		MongoClientURI uri  = new MongoClientURI("mongodb://localhost:27017/stream"); 
        MongoClient mongoClient = new MongoClient(uri);
        DB db = mongoClient.getDB(uri.getDatabase());
		System.out.println("MONGODB SUCCESS");
		
		DBCollection dbcoll = db.getCollection("streams");
		long dbsize = dbcoll.count();
		return dbsize;
	}

	
}
