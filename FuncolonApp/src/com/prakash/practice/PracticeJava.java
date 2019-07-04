package com.prakash.practice;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class PracticeJava {

	public static void main(String[] args) {

		List<Integer> inputList = Arrays.asList(1, 1, 2, 3, 3, 3, 4, 5, 6, 6, 6, 7, 8);
		
		//To list get the unique records from a given list
		System.out.println("Unique Records: ");
		inputList.stream().distinct()
				 .collect(Collectors.toList())
				 .forEach(System.out::println);

		System.out.println("Frequency: "+Collections.frequency(inputList, 1));//returns 2
		//System.out.println(outputList);
		
		
		//To list out duplicate records in a stream
		System.out.println("Duplicate Records: ");
		inputList.stream().filter(i -> Collections.frequency(inputList, i) > 1)
						  .collect(Collectors.toSet())
						  .forEach(System.out::println);

	}

}
