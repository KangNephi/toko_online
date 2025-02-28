<?php
session_start();
include '../koneksi.php';

// Periksa apakah user sudah login dan role-nya admin
if (!isset($_SESSION['id_user']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

// Proses pencarian barang
$search = isset($_GET['search']) ? $_GET['search'] : '';
$query = "SELECT * FROM barang";
if ($search) {
    $query .= " WHERE nama_barang LIKE :search";
}
$stmt = $conn->prepare($query);
if ($search) {
    $stmt->bindValue(':search', "%$search%");
}
$stmt->execute();
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            background: #121212;
            color: #ffffff;
        }

        .navbar {
            background: linear-gradient(45deg, #ff0000, #800080, #0000ff);
        }

        .navbar-brand {
            color: #fff;
            font-weight: bold;
        }

        .jumbotron {
            background: linear-gradient(45deg, #0000ff, #ff0000, #800080);
            color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.5);
        }

        .card {
            background: #1f1f1f;
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
        }

        .card img {
            max-height: 250px;
            object-fit: cover;
        }

        .card-title,
        .card-text {
            color: #fff;
        }

        footer {
            position: relative;
            bottom: 0;
            width: 100%;
            background: #000000;
        }

        footer p {
            margin: 0;
            font-size: 14px;
        }

        footer a {
            text-decoration: none;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="adminDashboard.php">Admin Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="manageBarang.php">Manage Barang</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="anggota.php">Anggota</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageOrders.php">Manage Orders</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link btn btn-danger text-white" href="../logout.php" onclick="return confirm('Apakah Anda yakin ingin logout?')">Logout</a>
                    </li>
                </ul>
            </div>

        </div>
    </nav>

    <div class="container mt-4">
        <div class="jumbotron text-center">
            <h1 class="animate__animated animate__fadeInDown">Selamat Datang, Admin!</h1>
            <p>Kelola data barang, anggota, dan pesanan di sini.</p>
        </div>

        <div class="mt-4">
            <form action="adminDashboard.php" method="GET" class="d-flex mb-3">
                <input type="text" name="search" class="form-control" placeholder="Cari Barang..." value="<?= htmlspecialchars($search) ?>">
                <button type="submit" class="btn btn-primary ms-2">Cari</button>
            </form>
        </div>
        <hr>
        <h2 class="text-center mb-4">Daftar Produk</h2>

        <div class="row">
            <?php foreach ($results as $row) : ?>
                <div class="col-md-4 mb-4">
                    <div class="card animate__animated animate__zoomIn">
                        <img src="../asset/img/<?= htmlspecialchars($row['gambar_barang']) ?>" class="card-img-top" alt="<?= htmlspecialchars($row['nama_barang']) ?>">
                        <div class="card-body">
                            <h5 class="card-title"><?= htmlspecialchars($row['nama_barang']) ?></h5>
                            <p class="card-text">Harga: Rp <?= number_format($row['harga_barang'], 0, ',', '.') ?></p>
                            <div class="row align-items-center">
                                <div class="col">
                                    <p class="card-text m-0">Stok: <?= htmlspecialchars($row['stok']) ?></p>
                                </div> 
                                <div class="col">
                                <p class="card-text m-0">Deskripsi: <?= htmlspecialchars($row['deskripsi']) ?></p>
                                </div>
                                <div class="col text-end">
                                    <a class="btn btn-primary" href="manageBarang.php">Kelola</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
    <footer class="bg-dark text-center text-white py-3 mt-5">
        <div class="container">
            <p>Copyright © GadgetAR Online Shop</p>
            <a href="https://github.com/Arigta?tab=repositories" target="_blank">
                <img src="https://cdn-icons-png.flaticon.com/512/25/25231.png" alt="GitHub Logo" width="30" height="30" style="filter: invert(1);">
            </a>
        </div>
    </footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>