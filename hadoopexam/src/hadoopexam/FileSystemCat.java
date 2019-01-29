package hadoopexam;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

public class FileSystemCat {
public static void main(String[] args) throws Exception {
		Configuration conf = new Configuration();
		conf.set("fs.default.name", "hdfs://master:9000");
		FileSystem hdfs = FileSystem.get(conf);
		FSDataInputStream in =null;
		try {
			in = hdfs.open(new Path("/bigedu/president_moon.txt"));
			IOUtils.copyBytes(in, System.out, 4096,false);
					
		}finally {
			IOUtils.closeStream(in);
		}
		
	}

}
