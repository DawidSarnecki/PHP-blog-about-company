<?php
	$connect->query(
	'SELECT Title, Status, Login, Text, X_UpdateTime, X_RemoveTime, X_CreateUser, blogtext.ID as blogtext_id 
	FROM blogtext 
	JOIN User ON blogtext.X_CreateUser = User.ID 
	WHERE X_RemoveTime IS NOT NULL
	ORDER BY Status DESC');
	$rows_rem = $connect->resultset();
	
	if ($rows_rem) : ?>
	<div class="row">		
	<div class="col-sm-12">	 	
	<div class="panel panel-primary">
	<div class="panel-heading">ARCHIWUM WPISÓW</div>
	<div class="panel-body">
	
	<?php foreach ($rows_rem as $row) : ?>
					<div>
					<h3><?php echo $row['Title']; ?></h3>
					<h10><?php echo $row['Login'].", ".$row['X_UpdateTime'].", usunięto: ".$row['X_RemoveTime']; ?></h10>
					<p><?php echo $row['Text']; ?></p>
					<form method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
					<ul class="nav navbar-nav navbar-right">
					<li>
						<input type="hidden" name="restore_id" value="<?php echo $row['blogtext_id']; ?>"/>
						<input type="submit" name="restore" value="Przywróć"/>
					</li>
					<li>
						<input type="hidden" name="delete_id" value="<?php echo $row['blogtext_id']; ?>"/>
						<input type="submit" name="delete" value="Usuń"/>
					</li>
					<li>
						<input type="submit" name="abort" value="Powrót do wpisów"/>
					</li>
					</ul>
					</div>
	<?php endforeach; ?>
	<?php endif; ?>

</div>
    </div>
	</div>