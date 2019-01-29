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
import com.zagle.service.domain.SearchStream;
import com.zagle.service.domain.Stream;
import com.zagle.service.stream.StreamRestDAO;

@Repository("mongoRestDAOImpl")
public class MongoRestDAOImpl implements StreamRestDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	 
	public MongoRestDAOImpl() {
       System.out.println(getClass()+"constructor call");		
	}
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public List<JSONObject> listMongo(SearchStream search) throws Exception {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();	
		List<JSONObject> list2 = new ArrayList<JSONObject>();
			try {
			 
			MongoClientURI uri  = new MongoClientURI("mongodb://192.168.0.21:27017/stream"); 
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
		MongoClientURI uri = new MongoClientURI("mongodb://192.168.0.21:27017/stream");
		MongoClient mongoClient = new MongoClient(uri);
		DB db = mongoClient.getDB(uri.getDatabase());
		
		System.out.println("몽고디비 성공");
		System.out.println(stream.getUser().getProfile());
		
		DBCollection dbcoll = db.getCollection("streams");
		
		WriteConcern w = new WriteConcern(1,2000);
		mongoClient.setWriteConcern(w);
		
		BasicDBObject addObject = new BasicDBObject();
		
		addObject.put("streamer",stream.getUser().getUserNo());
		addObject.put("streamerProfile","default.jpg");
		addObject.put("streamNickname",stream.getUser().getUserNickname());
		addObject.put("streamTitle",stream.getStreamTitle());
		addObject.put("streamContent",stream.getStreamContent());
		addObject.put("streamSum",stream.getStreamSum());
		addObject.put("streamLikeCount",0);
		addObject.put("streamViewCount",0);
	    dbcoll.insert(addObject);
        mongoClient.close();       
	}
	
	@Override
	public void joinMongo(Map<String,Object> map) throws Exception {
	
		System.out.println("StreamRestDao입니다");
		MongoClientURI uri = new MongoClientURI("mongodb://192.168.0.21:27017/stream");
		MongoClient mongoClient = new MongoClient(uri);
		DB db = mongoClient.getDB(uri.getDatabase());
		
		
		System.out.println("몽고디비 성공 JoinMongo");
		
		ArrayList list = new ArrayList();
		
		list.add(map.get("userNo"));
		list.add(map.get("userProfile"));
		list.add(map.get("userNickname"));
		
		DBCollection dbcoll = db.getCollection("streams");
		
		WriteConcern w = new WriteConcern(1,2000);
		mongoClient.setWriteConcern(w);
		
		 BasicDBObject updateQuery = new BasicDBObject().append("$set", new BasicDBObject().append("streamer",map.get("streamer")));
	        BasicDBObject searchQuery = new BasicDBObject().append("join",list);
	        dbcoll.update(searchQuery, updateQuery);
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
	public long getTotalCount(SearchStream search) throws Exception {
		// TODO Auto-generated method stub
		MongoClientURI uri  = new MongoClientURI("mongodb://192.168.0.21:27017/stream"); 
        MongoClient mongoClient = new MongoClient(uri);
        DB db = mongoClient.getDB(uri.getDatabase());
		System.out.println("MONGODB SUCCESS");
		
		DBCollection dbcoll = db.getCollection("streams");
		long dbsize = dbcoll.count();
		return dbsize;
	}
	@Override
	public long checkBan(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		MongoClientURI uri  = new MongoClientURI("mongodb://192.168.0.21:27017/stream"); 
        MongoClient mongoClient = new MongoClient(uri);
        DB db = mongoClient.getDB(uri.getDatabase());
		System.out.println("MONGODB SUCCESS");


		DBCollection dbcoll = db.getCollection("streams");
		BasicDBObject query = new BasicDBObject();
		query.put("banList.userNo",map.get("userNo")); 
		long dbsize = dbcoll.find(query).count();
		return dbsize;
	
	}

	
}
