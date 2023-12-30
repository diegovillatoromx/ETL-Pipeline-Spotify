# Define your database name
database_name="music_db" 

# Define the common IAM role name for all crawlers
role_name="rol_crawler"
 
# Define S3 paths for the crawlers
crawler_paths=("s3://spotify-pipeline/processed_data/songs_data/" "s3://spotify-pipeline/processed_data/artist_data/" "s3://spotify-pipeline/processed_data/album_data/")

# Define the names of the crawlers
crawler_names=("crawler_song" "crawler_artist" "crawler_album")

# Create the database
aws glue create-database --database-input "Name=$database_name"

# Loop through the S3 paths and create crawlers
for ((i=0; i<${#crawler_paths[@]}; i++)); do
  path="${crawler_paths[$i]}"
  crawler_name="${crawler_names[$i]}"
  
  # Create the crawler and let it infer the schema
  aws glue create-crawler --name "$crawler_name" --role "$role_name" --database-name "$database_name" --targets "S3Targets=[{Path='$path'}]"

  # Start the crawler
  aws glue start-crawler --name "$crawler_name"

  # Display a confirmation message
  echo "Crawler '$crawler_name' created and running."
done
