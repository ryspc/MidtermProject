package com.skilldistillery.housereport.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.PropertyType;
import com.skilldistillery.housereport.entities.User;

@Service
@Transactional
public class ListingPhotoDAOImpl implements ListingPhotoDAO{
	ListingDAO listingDao;
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public ListingPhoto findById(int id) {
		return em.find(ListingPhoto.class,id);
	}

	@Override
	public ListingPhoto create(Listing listing, User user, Address address, PropertyType propertyType, ListingPhoto listingPhoto) {
		Listing dbListing = listingDao.create(listing, user, address, propertyType);
		listingPhoto.setListing(dbListing);
//		listing.setListingPhotos(null);
//		listing.getListingPhotos().add(listingPhoto);
		em.persist(dbListing);
		em.persist(listingPhoto);
		em.flush();
		dbListing.addPhoto(listingPhoto);
		return dbListing.getListingPhotos().get(0);
	}

	@Override
	public ListingPhoto update(ListingPhoto listingPhoto, Listing listing) {
		ListingPhoto dbListingPhoto = em.find(ListingPhoto.class, listingPhoto.getId());
		dbListingPhoto.setImgUrl(listingPhoto.getImgUrl());
		dbListingPhoto.setListing(listingPhoto.getListing());
		return dbListingPhoto;
	}

	@Override
	public boolean delete(ListingPhoto listingPhoto) {
		ListingPhoto dbListingPhoto = em.find(ListingPhoto.class, listingPhoto.getId());
		em.remove(dbListingPhoto);
		boolean successfulDelete = !em.contains(dbListingPhoto);
		return successfulDelete;
	}

}