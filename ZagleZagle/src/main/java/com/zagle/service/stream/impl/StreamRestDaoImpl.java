package com.zagle.service.stream.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.WriteConcern;
import com.zagle.common.Search;
import com.zagle.service.domain.Stream;
import com.zagle.service.stream.StreamRestDao;

@Repository("StreamRestDaoImpl")


public class StreamRestDaoImpl implements StreamRestDao{

	@Override
	public List<Stream> listMongo(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
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

	
}
