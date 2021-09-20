A tool that helps me index pirated music files.

## usage
```sh
cd mp3-tree-metadata
./indexer.rb path/to/my/music/tree
```

## required tree structure

Either `root/Artist Name/Album Name/XX Song Name.mp3`, where XX is track number
Or `root/Artist Name/Album Name but stored as a single file.mp3`

```
ROOT/
  |--- Artist 1/
  |       |----- Album 1/
  |       |       |--- "01 Song Name.mp3"
  |       |       |--- "02 Song Name.mp3"
  |       |       '--- etc.
  |       |----- Album 2/
  |               |--- "01 Song Name.mp3"
  |               '--- etc. 
  |--- Artist 2/
  |       |----- Album 1/
  |       |       |--- "01 Song Name.mp3"
  |       |       |--- "02 Song Name.mp3"
  |       |       '--- etc.
  |       |----- Album 2/
  |               |--- "01 Song Name.mp3"
  |               '--- etc. 
  |--- Artist 3/
  |       |----- "Album 1.mp3"
  |       |----- "Album 2.mp3"
  |       '----- "Album 3.mp3"
 ...
```
