package com.helper;

public class SpiltHelper {

public static void main(String args[]){  
String s1="java string split method by javatpoint java string split method by javatpoint";  
String[] words=s1.split("\\s");//splits the string based on whitespace  
//using java foreach loop to print elements of string array  

if(words.length>10) {
	 
	for(int i=0;i<10;i++){  
		System.out.println(words[i]);
}
}else {
		System.out.println(s1);

  
}  
}
}  