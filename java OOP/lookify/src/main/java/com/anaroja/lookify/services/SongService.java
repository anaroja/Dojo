package com.anaroja.lookify.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.anaroja.lookify.models.Song;
import com.anaroja.lookify.repositories.SongRepository;


@Service
public class SongService {
	private SongRepository songRepository;
    public SongService(SongRepository songRepository){
        this.songRepository = songRepository;
    }

	public List<Song> allSongs(){
        return songRepository.findAll();
	}
	
	public Song findSongById(Long id) {
		Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
	}
	
	public List<Song> findByArtist(String artist) {
		return songRepository.findByArtistContaining(artist);
	}
	
	public void addSong(@Valid Song song) {
		songRepository.save(song);
	}
	public void updateSong(@Valid Song song) {
		songRepository.save(song);
		
	}
	public void destroySong(Long id) {
		songRepository.deleteById(id);
	}

	public List<Song> topTen() {
		return songRepository.findTop10ByOrderByRatingDesc();
	}
}
