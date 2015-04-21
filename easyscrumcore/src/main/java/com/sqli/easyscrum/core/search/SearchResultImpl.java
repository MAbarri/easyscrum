package com.sqli.easyscrum.core.search;

import java.util.List;

public class SearchResultImpl<E> implements SearchResult<E> {

	private int count;

	private int totalCount;

	List<E> result;

	int requestedStart;

	int requestedCount;

	/**
	 * Gets size of result collection. Same as {@link #getRequestedCount()} or
	 * less (if less elements are found)
	 */
	@Override
	public int getCount() {
		return count;
	}

	/**
	 * Gets size of collection without using range. Attention: When
	 * {@link FlexibleSearchQuery#isNeedTotal()}= <code>false</code> (default)
	 * than this total count is the same as {@link #getRequestedCount()} or
	 * less. It is not the total count of all elements in the db. (only when
	 * isNeedTotal=true)
	 */
	@Override
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * Gets the search result. Returned collection uses lazy translation
	 * approach, on first access on an collection element the element will be
	 * translated to an model. <b>In case the entity was removed between
	 * gathering of search result and translation of specific element the
	 * returned collection will have a <code>null</code> value at this
	 * position.</b>
	 */
	@Override
	public List<E> getResult() {
		return result;
	}

	/**
	 * Gets requested start index. Same value as set in
	 * {@link FlexibleSearchQuery#setStart(int)}
	 */
	@Override
	public int getRequestedStart() {
		return requestedStart;
	}

	/**
	 * Gets requested result count. Same value as set in
	 * {@link FlexibleSearchQuery#setCount(int)}
	 */
	@Override
	public int getRequestedCount() {
		return requestedCount;
	}

	public void setCount(final int count) {
		this.count = count;
	}

	public void setTotalCount(final int totalCount) {
		this.totalCount = totalCount;
	}

	public void setResult(final List<E> result) {
		this.result = result;
	}

	public void setRequestedStart(final int requestedStart) {
		this.requestedStart = requestedStart;
	}

	public void setRequestedCount(final int requestedCount) {
		this.requestedCount = requestedCount;
	}
}
