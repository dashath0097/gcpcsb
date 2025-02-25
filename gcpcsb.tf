provider "google" {
  project = "checkin-436517"  # Replace with your project ID
  region  = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name          = "dashath_bucket"  # Replace with a globally unique name
  location      = "US"  # Specify the bucket location
  storage_class = "STANDARD"  # Storage class: STANDARD, NEARLINE, COLDLINE, ARCHIVE

  versioning {
    enabled = true  # Enable object versioning
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30  # Auto-delete objects older than 30 days
    }
  }
}
