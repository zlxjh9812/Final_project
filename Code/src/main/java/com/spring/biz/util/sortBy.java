package com.spring.biz.util;

import java.util.Comparator;
import java.util.Date;

import com.spring.biz.movie.ContentsVO;

public class sortBy {
	
	public class SortByDate implements Comparator<ContentsVO> {
		@Override
		public int compare(ContentsVO o1, ContentsVO o2) {
			Date first = o1.getRelease_date();
			Date second = o2.getRelease_date();
			return second.compareTo(first);
		}
	}

	
}
