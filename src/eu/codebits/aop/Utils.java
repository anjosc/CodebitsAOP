package eu.codebits.aop;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;

import android.util.Log;

public class Utils {

	private static final String TAG = "Utils";
	
	public static HttpClient getHttpClient(int timeout) {
		HttpClient httpclient = new DefaultHttpClient();
		HttpParams params = httpclient.getParams();
		HttpConnectionParams.setConnectionTimeout(params, timeout);
		HttpConnectionParams.setSoTimeout(params, timeout);
		return httpclient;
	}

	public static String urlAsString(String url, HttpRequestBase httpmethod) throws IOException {
		
		HttpClient httpclient = getHttpClient(60000);

		HttpResponse response = httpclient.execute(httpmethod);
		//	Log.d(this, response.getStatusLine().toString());

		HttpEntity entity = response.getEntity();

		if (entity != null) {
			String result = EntityUtils.toString(entity);
			entity.consumeContent();
			return result;
		} else {
			return null;
		}
		
	}

	public static String postURLasString(String url) throws IOException {
		List<NameValuePair> nameValues;
		HttpPost httpPost;
		try {
			nameValues = URLEncodedUtils.parse(new URI(url), "utf8");
			int queryIndex = url.indexOf('?');
			if (queryIndex >= 0) {
				url = url.substring(0,queryIndex);
			}
			httpPost = new HttpPost(url);
			httpPost.setEntity(new UrlEncodedFormEntity(nameValues));
		} catch (URISyntaxException e) {
			Log.d(TAG, "Bad uri: " + url+", trying anyway with default parsing");
			httpPost = new HttpPost(url); // hope for the best
		}
		return urlAsString(url, httpPost);
	}
	public static String getURLasString(String url) throws IOException {
		return urlAsString(url, new HttpGet(url));
	}

}
